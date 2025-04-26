import 'package:flutter/material.dart';

class Review {
  final String reviewerName;
  final double rating;
  final String comment;
  final DateTime date;

  Review({
    required this.reviewerName,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

class ProviderProfileCard extends StatelessWidget {
  final String name;
  final double averageRating;
  final int completedJobs;
  final List<String> specialties;
  final List<Review> reviews;

  const ProviderProfileCard({super.key, 
    required this.name,
    required this.averageRating,
    required this.completedJobs,
    required this.specialties,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFF1976D2),
                  child: Text(
                    name.substring(0, 1),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          averageRating.toStringAsFixed(1),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '($completedJobs עבודות)',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'התמחויות:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: specialties
                  .map((spec) => Chip(
                        label: Text(spec),
                        backgroundColor: Color(0xFFE3F2FD),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              'ביקורות אחרונות:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...reviews.take(3).map((review) => _buildReviewTile(review)),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewTile(Review review) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                review.reviewerName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(
                '${review.date.day}/${review.date.month}/${review.date.year}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < review.rating.floor()
                    ? Icons.star
                    : Icons.star_border,
                color: Colors.amber,
                size: 16,
              );
            }),
          ),
          SizedBox(height: 4),
          Text(review.comment),
          Divider(),
        ],
      ),
    );
  }
}