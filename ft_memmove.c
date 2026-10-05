/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: verosvec <verosvec@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/18 15:33:01 by verosvec          #+#    #+#             */
/*   Updated: 2026/10/05 20:05:14 by verosvec         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memmove(void *dest, const void *src, size_t n)
{
	unsigned char		*udest;
	const unsigned char	*usrc;
	size_t				i;

	if (!dest && !src)
		return (NULL);
	udest = (unsigned char *)dest;
	usrc = (const unsigned char *)src;
	if ((uintptr_t)udest < (uintptr_t)usrc)
	{
		i = 0;
		while (i < n)
		{
			udest[i] = usrc[i];
			i++;
		}
	}
	else
	{
		i = n;
		while (i > 0)
		{
			udest[i - 1] = usrc[i - 1];
			i--;
		}
	}
	return (dest);
}
