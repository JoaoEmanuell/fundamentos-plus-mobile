import 'package:flutter/material.dart';
import 'package:fundamentos_plus_mobile/components/ui/multiline_text.dart';

ClipRRect searchLessonPreview(int id, String title, String description) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                multilineText(
                    250,
                    Text(
                      title,
                      style: TextStyle(fontSize: 18),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )),
                Text(
                  "#$id",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  child: Text(
                "Nesta centésima vigésima quarta lição, aprenderemos sobre o tema “Profetas e Evangelistas”. Veremos o funcionamento destes dois ministérios e, para isto, seremos desafiados a não nos prendermos às pré-noções que os termos carregam e que os afasta do seu real sentido. Teremos a oportunidade de comparar o Velho e o Novo Testamento, à guisa de aprofundar nossa compreensão sobre o tema.",
                style: TextStyle(fontSize: 12),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              )),
            ),
          ],
        ),
      ),
    ),
  );
}
