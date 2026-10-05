/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: verosvec <verosvec@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/20 15:17:52 by verosvec          #+#    #+#             */
/*   Updated: 2026/10/05 19:07:11 by verosvec         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlcat(char *dst, const char *src, size_t size)
{
	size_t	srclength;
	size_t	dstlength;
	size_t	i;

	srclength = ft_strlen(src);
	dstlength = 0;
	while (dstlength < size && dst[dstlength] != '\0')
		dstlength++;
	if (dstlength == size)
		return (srclength + size);
	i = 0;
	while (src[i] != '\0' && (dstlength + i) < (size - 1))
	{
		dst[dstlength + i] = src[i];
		i++;
	}
	dst[dstlength + i] = '\0';
	return (dstlength + srclength);
}
